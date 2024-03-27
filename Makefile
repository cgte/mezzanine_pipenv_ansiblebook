
mezza_dir = mezzanine_example
instance_port = 8008

clean:
	pipenv --rm
	touch $(mezza_dir)/dev.db && rm $(mezza_dir)/dev.db

install:
	pipenv install

default-install-sqlite:
	cd $(mezza_dir) && pipenv run python manage.py createdb --noinput
	# plus creates sameple data so that we can checl login

migrate:
	cd $(mezza_dir)  && pipenv run python manage.py migrate

run-local:
	cd $(mezza_dir) && pipenv run python manage.py runserver 127.0.0.1:$(instance_port)

run-vagrant:
	cd $(mezza_dir) && pipenv run python manage.py runserver --settings=mezzanine_example.vagrant 0.0.0.0:$(instance_port)


build_run: install default-install-sqlite run-local

