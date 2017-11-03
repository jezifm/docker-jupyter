FROM jupyter/notebook

# install java
RUN \
    apt-get update && \
    apt-get -y install software-properties-common
RUN \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    apt-get install -y oracle-java8-installer && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer
# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# python dependencies
RUN pip install iplantuml

# local files
COPY plantuml.jar /usr/local/bin/plantuml.jar

# docker interface
EXPOSE 8888
CMD ["jupyter", "notebook"]
