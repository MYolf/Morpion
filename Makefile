# Makefile

NAME = Morpion

SRCS = main.c \
	tic-tac-toe.c	

CFLAGS = -Wall -Wextra -O2 -Wno-unused-result

all: $(NAME)

$(NAME): $(SRCS)
	gcc $(CFLAGS) $(SRCS) -o $(NAME)

fclean:
	rm -f $(NAME)

re: fclean all