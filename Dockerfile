FROM debian:latest

RUN apt-get update && apt-get install -y oathtool

# Def la commande par défaut
ENTRYPOINT ["oathtool"]
