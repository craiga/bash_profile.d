# brew install openssl
# https://github.com/pyca/cryptography/issues/3489

export PATH="/usr/local/opt/openssl/bin:$PATH"
export CPPFLAGS=-I/usr/local/opt/openssl/include
export LDFLAGS=-L/usr/local/opt/openssl/lib
