FROM dart

RUN apt-get update
RUN apt-get install -y curl git unzip xz-utils zip libglu1-mesa man zsh nano cmake fontconfig

RUN apt-get clean
RUN chsh -s $(which zsh)

RUN git clone https://github.com/flutter/flutter.git -b beta --depth 1 /flutter
ENV PATH="/flutter/bin:$PATH"
RUN flutter doctor
