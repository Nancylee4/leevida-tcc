// Converte os manuais HTML em PDF com o Chrome instalado.
const path = require('path');
const { chromium } = require('playwright-core');

const OUT = process.argv[2];
const DOCS = [
  ['programador.html', 'LeeVida-Manual-do-Programador.pdf', 'Manual do Programador'],
  ['utilizador.html', 'LeeVida-Manual-do-Utilizador.pdf', 'Manual do Utilizador'],
];

(async () => {
  const browser = await chromium.launch({ executablePath: 'C:/Program Files/Google/Chrome/Application/chrome.exe' });
  const page = await browser.newPage();
  for (const [src, dst, title] of DOCS) {
    await page.goto('file:///' + path.join(__dirname, src).replace(/\\/g, '/'), { waitUntil: 'load' });
    await page.pdf({
      path: path.join(OUT, dst),
      format: 'A4',
      printBackground: true,
      preferCSSPageSize: true,
      displayHeaderFooter: true,
      headerTemplate: '<div></div>',
      footerTemplate:
        '<div style="width:100%;font-size:7.5pt;color:#8a84a0;padding:0 18mm;display:flex;justify-content:space-between;font-family:Segoe UI,Arial">' +
        `<span>LeeVida · ${title}</span><span><span class="pageNumber"></span> / <span class="totalPages"></span></span></div>`,
    });
    console.log('ok', dst);
  }
  await browser.close();
})();
