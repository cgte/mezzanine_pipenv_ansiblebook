
mezza_dir = mezzanine_example

clean:
	pipenv --rm
	touch $(mezza_dir)/dev.db && rm $(mezza_dir)/dev.db

install:
	pipenv install

default-install-sqlite:
	cd $(mezza_dir) && pipenv run python manage.py createdb --noinput

migrate:
	cd $(mezza_dir)  && pipenv run python manage.py migrate

run-local:
	cd $(mezza_dir) && pipenv run python manage.py runserver 127.0.0.1:8008


build_run: install default-install-sqlite run-local

