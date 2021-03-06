
IMAGE = natasha/nerus-ctl

image:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)

test:
	pytest -vv --pep8 --flakes nerus

int:
	pytest -vv --capture=no --int nerus --cov nerus --cov-report term-missing

cov:
	pytest -vv --cov nerus --cov-report term-missing

clean:
	find . -name '*.pyc' -not -path '*/__pycache__/*' -o -name .DS_Store | xargs rm
	rm -rf dist build *.egg-info coverage.xml
