# Converte os manuais HTML em documentos Word (.docx) editáveis, com as imagens embutidas.
# Requer o Microsoft Word instalado. Uso (a partir desta pasta):
#   powershell -ExecutionPolicy Bypass -File to-word.ps1
$ErrorActionPreference = 'Stop'
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$out = Split-Path -Parent $here
$docs = @(
  @('programador.html', 'LeeVida-Manual-do-Programador.docx'),
  @('utilizador.html', 'LeeVida-Manual-do-Utilizador.docx')
)

$word = New-Object -ComObject Word.Application
$word.Visible = $false
$word.DisplayAlerts = 0
try {
  foreach ($d in $docs) {
    $dst = Join-Path $out $d[1]
    # Cópia temporária do HTML adaptada ao Word (na mesma pasta, para os caminhos relativos das imagens)
    $html = [IO.File]::ReadAllText((Join-Path $here $d[0]), [Text.Encoding]::UTF8)
    $toc = [regex]::Match($html, '(?s)<section class="toc">.*?</section>').Value
    if ($toc) {
      $t = $toc -replace '<ol><li>', '<p style="margin:0 0 4pt 18pt;font-size:9.5pt;color:#6b6580">' `
                -replace '</li></ol></li>', '</p>' `
                -replace '<li>', '<p style="font-weight:bold;margin:6pt 0 1pt 0">' `
                -replace '</li>', '</p>' -replace '</?ol>', ''
      $html = $html.Replace($toc, $t)
    }
    # Título das caixas de nota/aviso/dica numa linha própria
    $html = $html -replace '(<div class="(?:note|warn|tip)"><b>[^<]*)</b>', '$1</b><br>'
    # Cada capítulo (h1) começa numa página nova, excepto o título da capa
    $i = 0
    $html = [regex]::Replace($html, '<h1', { param($m) $script:i++; if ($script:i -eq 1) { '<h1' } else { '<br clear="all" style="page-break-before:always"><h1' } })
    $src = Join-Path $here ('_word-' + $d[0])
    [IO.File]::WriteAllText($src, $html, (New-Object Text.UTF8Encoding $true))
    $doc = $word.Documents.Open($src, $false, $true)
    # Layout de impressão em A4 com margens de 2 cm
    $word.ActiveWindow.View.Type = 3
    $ps = $doc.PageSetup
    $ps.PaperSize = 7
    $ps.TopMargin = 56.7; $ps.BottomMargin = 56.7; $ps.LeftMargin = 56.7; $ps.RightMargin = 56.7
    # Embutir as imagens (no HTML são ligações a ficheiros)
    foreach ($s in @($doc.InlineShapes)) {
      if ($s.LinkFormat) { $s.LinkFormat.SavePictureWithDocument = $true; $s.LinkFormat.BreakLink() }
    }
    foreach ($s in @($doc.Shapes)) {
      if ($s.LinkFormat) { $s.LinkFormat.SavePictureWithDocument = $true; $s.LinkFormat.BreakLink() }
    }
    # Imagens maiores do que a largura útil da página são reduzidas
    $maxW = $ps.PageWidth - $ps.LeftMargin - $ps.RightMargin
    foreach ($s in @($doc.InlineShapes)) {
      if ($s.Width -gt $maxW) { $s.LockAspectRatio = -1; $s.Width = $maxW }
    }
    if (Test-Path $dst) { Remove-Item $dst -Force }
    $doc.SaveAs2([string]$dst, 16)   # 16 = wdFormatDocumentDefault (.docx)
    $doc.Close(0)
    Remove-Item $src -Force
    Write-Output "ok $($d[1])"
  }
} finally {
  $word.Quit()
  [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($word)
}
