# Open eCoach: open Electronic COding Assigments Check

1) check out this repo recursively
```bash
git clone --recurse-submodules -j8 https://github.com/FellowsFreiesWissen/openEcoach.git
cd openEcoach
```
2) build the Docker container
```bash
docker build -t physikerwelt/praktomat-dev .
```
3) run the docker container
```bash
docker run --name praktomat -p8000:8000 physikerwelt/praktomat-dev
```
4) Open [localhost:8000](http://localhost:8000/) in your browser and log in with username `admin` and password `admin`.