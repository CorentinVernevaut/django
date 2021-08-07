# django
A small website in django

docker run --rm [...] pour automatiquement supprimer un conteneur quand il a terminé sa tâche

##Comprendre les volumes
docker run --rm -ti -v /tmp/corentin:/super_corentin alpine sh
/tmp/corentin --> ordinateur
/super_corentin --> conteneur (dossier partagé)