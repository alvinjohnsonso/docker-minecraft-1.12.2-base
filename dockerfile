FROM openjdk:8

ENV INSTALL_JAR="forge-1.12.2-14.23.5.2854-installer.jar"
ENV SERVER_JAR="forge-1.12.2-14.23.5.2854.jar"
ENV MIN_RAM="1024M"
ENV MAX_RAM="4096M"
ENV JAVA_PARAMETERS="-XX:+UseG1GC -Dsun.rmi.dgc.server.gcInterval=2147483646 -XX:+UnlockExperimentalVMOptions -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M -Dfml.readTimeout=180"

WORKDIR /usr/src/app/

COPY ./lib .
RUN chmod +x install.sh

# file permissions
RUN chmod +x install.sh server.sh

RUN ./install.sh
RUN ./server.sh

RUN sed -i 's/eula=false/eula=true/g' eula.txt

EXPOSE 25565

CMD ["./server.sh"]
