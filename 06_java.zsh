export JAVA_OPTS="-d64 \
-ea \
-Xms1024m \
-Xmx2048m \
-XX:+UseG1GC \
-XX:ParallelGCThreads=8 \
-XX:+AggressiveOpts \
-XX:+UnlockCommercialFeatures \
-XX:+UnlockDiagnosticVMOptions \
-XX:+UnlockExperimentalVMOptions \
-XX:+UseRTMLocking \
-XX:+UseRTMDeopt"

alias java="java ${JAVA_OPTS}"
