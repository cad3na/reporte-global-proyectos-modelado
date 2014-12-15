TARGET=reporte
OUTDIR=./PDF's/
.PHONY: all complete report clean

all: complete clean

complete: report move

report:
	@${MAKE} clean
	@echo "==============================================="
	@echo "Compilando con pdflatex, el archivo:" $(TARGET)
	@pdflatex -interaction=batchmode $(TARGET).tex || cat $(TARGET).log | grep -A1 "!"
	@pdflatex -interaction=batchmode $(TARGET).tex
	@pdflatex -interaction=batchmode $(TARGET).tex

move:
	@echo "==============================================="
	@echo "Moviendo el archivo a la carpeta de PDF's."
	@mv "$(TARGET).pdf" "$(OUTDIR)$(TARGET).pdf"

clean:
	@echo "==============================================="
	@echo "Quitando archivos irrelevantes."
	@rm -rf *.aux *.log *.fdb_latexmk *.synctex.gz *.out *.tdo *.toc
