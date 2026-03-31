CC = cc
CFLAGS = -Wall -Wextra -O2 -std=c11
LDFLAGS = -lm
HEADERS = rh_scaffold.h rh_zeta.h

EXPERIMENTS = exp01_prime_scaffold \
              exp02_zeta_scaffold \
              exp03_sieve_layers \
              exp04_contraction \
              exp05_rotation_depth

all: $(EXPERIMENTS)

% : %.c $(HEADERS)
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

clean:
	rm -f $(EXPERIMENTS)

run: all
	@for exp in $(EXPERIMENTS); do \
		echo ""; \
		echo "════════════════════════════════════════════════════════════════"; \
		echo "RUNNING: $$exp"; \
		echo "════════════════════════════════════════════════════════════════"; \
		./$$exp; \
	done

.PHONY: all clean run
