FROM debian:stable-slim
LABEL author="Duckey"
LABEL LastUpdated="12/30/2024"

COPY ./scripts /scripts

RUN apt update -y \
     && apt upgrade -y

RUN bash /scripts/installRequirements.bash     
RUN bash /scripts/coolerBash.bash
RUN bash /scripts/sshFeature.bash
RUN ssh-keygen -A
RUN bash /scripts/coderInstaller.bash
RUN bash /scripts/banner.sh
CMD ["/usr/sbin/sshd", "-D"]