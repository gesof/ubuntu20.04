FROM ubuntu:20.04

ENV TZ 'Europe/Tallinn'
RUN echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y dialog apt-utils tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

RUN apt-get install -y \
        git \
        openssh-client \
        openssh-server \
        sshpass \
        unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*



RUN mkdir /var/run/sshd

RUN echo 'root:indig0!' | chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD /usr/sbin/sshd -D
