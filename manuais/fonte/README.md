# Fontes dos manuais

Os HTML desta pasta são a fonte dos manuais. A partir deles geram-se:

- os **PDF** (`../LeeVida-Manual-do-*.pdf`), com o Chrome;
- as **versões Word** (`../LeeVida-Manual-do-*.docx`), com o Microsoft Word, para edição manual.

```bash
npm install playwright-core
node render.js ..            # PDF
powershell -ExecutionPolicy Bypass -File to-word.ps1   # Word (.docx)
```

As imagens (capturas e diagramas) são lidas com caminhos relativos a partir de `../../` (raiz do repositório `leevida-tcc`), por isso funcionam em qualquer pasta onde o repositório seja clonado.

Se editar directamente o `.docx`, as alterações não voltam para o HTML nem para o PDF: nesse caso, exporte o PDF a partir do próprio Word (Ficheiro → Guardar como → PDF).
