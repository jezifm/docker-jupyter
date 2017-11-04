build-run:
	docker build -t jupyter-plantuml .; docker stop some-jupyter-plantuml; docker run -p 8888:8888 -d --name some-jupyter-plantuml jupyter-plantuml
