###################################
# Inception
###################################

NAME = inception

# CC = clang

# CFLAGS = -Wall -Wextra -Werror

# INCLUDES = includes

# SRC = $(addprefix srcs/, \
# 		push_swap.c parsing.c instructions.c algorithm.c \
# 		list_utils1.c list_utils2.c list_utils3.c list_utils4.c)

# OBJ = $(SRC:c=o)

###################################
# Methods
###################################

all: $(NAME)

$(NAME):
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress
	sudo docker-compose down
	sudo docker-compose up --build -d

ready: extract all

extract:
	sudo rm -rf ~/data/*
	sudo tar xzvf ./inception.tar.gz -C ~/

clean:
	sudo docker-compose down
	sudo docker volume rm -f inception_wpfiles
	sudo docker volume rm -f inception_dbfiles

fclean: clean
	sudo rm -rf ~/data

re: fclean all

.PHONY: clean fclean re ready extract