#!/bin/bash
if [[ $PLATFORM == 'Linux' ]]; then
    alias ls='ls --color'
fi

alias ll='ls -lAF'

alias packer='packer-color --auronly'

function gcb() {
  git branch | grep '^\*' | cut -c3-
}

function gfb() {
  branch=`gcb`

  git checkout master && git pull --prune

  if [[ $1 == '--force' || -z `git branch --no-merged master | grep $branch` ]]; then
    git branch -D $branch # && git push origin :$branch
  else
    echo "Hey, man, $branch isn't merged yet!"
    git checkout $branch
  fi
}

function pair_term() {
  echo "XTerm*FaceSize: 13" | xrdb -merge -
}

function solo_term() {
  echo "XTerm*FaceSize: 11" | xrdb -merge -
}

function venv() {
  . /Users/krockman/.local/venvs/${1}/bin/activate
}

function rde() {
 ssh -t $1 sudo docker exec -it service_app bash
}

function rdt() {
 ssh -t $1 sudo supervisorctl tail -f service-app
}

function dkr() {
  docker kill $1 && docker rm $1
}

function de() {
  docker exec -it $@
}

function dc() {
  docker-compose $@
}
function dcc() {
    dc kill
    dc rm -f
    docker-cleanup
}

function docker-cleanup() {
  docker ps -a -q -f "status=exited" | xargs docker rm
  docker images --filter "dangling=true" -q | xargs docker rmi
  docker volume ls -qf dangling=true | xargs docker volume rm
  docker network ls -q | xargs docker network rm
}

function install_pipsi() {
    if [ ! -f $HOME/.local/bin/pipsi ]; then
        curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python
    fi
}

