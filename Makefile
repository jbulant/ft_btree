#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jbulant <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/07 16:49:28 by jbulant           #+#    #+#              #
#    Updated: 2018/03/22 06:52:41 by fjanoty          ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME = ft_graph.a

override DEBUG = 1

LIBFTDIR = libft/
LIBFT_NAME = libft.a
LIBFT = $(LIBFTDIR)$(LIBFT_NAME)

SRCSDIR = srcs/
SRCS_NAME = btree_create_node.c \
			btree_insert_data.c \
			btree_rotate.c		\
			btree_search_item.c \
			ft_graph_utils.c	\

SRCS = $(addprefix $(SRCSDIR),$(SRCS_NAME))

OBJDIR = objs/
OBJS = $(addprefix $(OBJDIR),$(SRCS_NAME:.c=.o))

INCLUDES = -Iincludes -Ilibft/includes
LIBS = -L $(LIBFTDIR) -lft

HEADERS_PATH = includes/
HEADERS_NAME = ft_graph.h ft_graph_utils.h
HEADERS = $(addprefix $(HEADERS_PATH), $(HEADERS_NAME))

CFLAGS = -Wall -Wextra -Werror
DEBUGFLAGS = -fsanitize=address -g3

.PHONY: all clean fclean re

all: $(NAME)

$(OBJDIR)%.o: $(SRCSDIR)%.c ${HEADERS}
	@mkdir -p objs
	@if [ $(DEBUG) -eq 1 ];\
	then\
		$(CC) $(CFLAGS) $(DEBUGFLAGS) $(INCLUDES) -c -o $@ $<;\
		echo [`echo $(NAME) | rev | cut -d '.' -f2 | rev`][DEBUG]converting: `echo $< | rev | cut -d'/' -f1 | rev`;\
	else\
		$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $<;\
		echo [`echo $(NAME) | rev | cut -d '.' -f2 | rev`]converting: `echo $< | rev | cut -d'/' -f1 | rev`;\
	fi

$(NAME): $(OBJS) $(LOBJS)
	ar rc $(NAME) $(OBJS) $(LOBJS)
	ranlib $(NAME)

$(LIBFT):
	make -C $(LIBFTDIR)

test: $(OBJS) $(LIBFT)
	@if [ $(DEBUG) -eq 1 ];\
	then\
		$(CC) $(CFLAGS) $(DEBUGFLAGS) $(INCLUDES) $(OBJS) main.c $(LIBS) -o `echo $(NAME) | rev | cut -d'.' -f2 | rev`_test;\
	else\
		$(CC) $(CFLAGS) $(INCLUDES) $(OBJS) main.c $(LIBS) -o `echo $(NAME) | rev | cut -d'.' -f2 | rev`_test;\
	fi

clean:
	rm -f $(OBJS)
	rm -rf $(OBJDIR)
	make -C $(LIBFTDIR) clean

fclean: clean
	rm -f $(NAME)
	make -C $(LIBFTDIR) fclean

re: fclean all

coffee:
	@clear
	@echo ""
	@echo "                   ("
	@echo "	                     )     ("
	@echo "               ___...(-------)-....___"
	@echo '           .-""       )    (          ""-.'
	@echo "      .-''''|-._             )         _.-|"
	@echo '     /  .--.|   `""---...........---""`   |'
	@echo "    /  /    |                             |"
	@echo "    |  |    |                             |"
	@echo "     \  \   |                             |"
	@echo "      '\ '\ |                             |"
	@echo "        '\ '|                             |"
	@echo "        _/ /\                             /"
	@echo "       (__/  \                           /"
	@echo '    _..---""` \                         /`""---.._'
	@echo " .-'           \                       /          '-."
	@echo ":               '-.__             __.-'              :"
	@echo ':                  ) ""---...---"" (                :'
	@echo "\'._                '"--...___...--"'              _.'"
	@echo '   \""--..__                              __..--""/'
	@echo "     '._     """----.....______.....----"""         _.'"
	@echo '         ""--..,,_____            _____,,..--"""'''
	@echo '                      """------"""'
	@sleep 0.5
	@clear
	@echo ""
	@echo "                 ("
	@echo "	                  )      ("
	@echo "               ___..(.------)--....___"
	@echo '           .-""       )   (           ""-.'
	@echo "      .-''''|-._      (       )        _.-|"
	@echo '     /  .--.|   `""---...........---""`   |'
	@echo "    /  /    |                             |"
	@echo "    |  |    |                             |"
	@echo "     \  \   |                             |"
	@echo "      '\ '\ |                             |"
	@echo "        '\ '|                             |"
	@echo "        _/ /\                             /"
	@echo "       (__/  \                           /"
	@echo '    _..---""` \                         /`""---.._'
	@echo " .-'           \                       /          '-."
	@echo ":               '-.__             __.-'              :"
	@echo ':                  ) ""---...---"" (                :'
	@echo "\'._                '"--...___...--"'              _.'"
	@echo '   \""--..__                              __..--""/'
	@echo "     '._     """----.....______.....----"""         _.'"
	@echo '         ""--..,,_____            _____,,..--"""'''
	@echo '                      """------"""'
	@sleep 0.5
	@clear
	@echo ""
	@echo "               ("
	@echo "	                  )     ("
	@echo "               ___..(.------)--....___"
	@echo '           .-""      )    (           ""-.'
	@echo "      .-''''|-._      (       )        _.-|"
	@echo '     /  .--.|   `""---...........---""`   |'
	@echo "    /  /    |                             |"
	@echo "    |  |    |                             |"
	@echo "     \  \   |                             |"
	@echo "      '\ '\ |                             |"
	@echo "        '\ '|                             |"
	@echo "        _/ /\                             /"
	@echo "       (__/  \                           /"
	@echo '    _..---""` \                         /`""---.._'
	@echo " .-'           \                       /          '-."
	@echo ":               '-.__             __.-'              :"
	@echo ':                  ) ""---...---"" (                :'
	@echo "\'._                '"--...___...--"'              _.'"
	@echo '   \""--..__                              __..--""/'
	@echo "     '._     """----.....______.....----"""         _.'"
	@echo '         ""--..,,_____            _____,,..--"""'''
	@echo '                      """------"""'
	@sleep 0.5
	@clear
	@echo ""
	@echo "             (         ) "
	@echo "	              )        ("
	@echo "               ___)...----)----....___"
	@echo '           .-""      )    (           ""-.'
	@echo "      .-''''|-._      (       )        _.-|"
	@echo '     /  .--.|   `""---...........---""`   |'
	@echo "    /  /    |                             |"
	@echo "    |  |    |                             |"
	@echo "     \  \   |                             |"
	@echo "      '\ '\ |                             |"
	@echo "        '\ '|                             |"
	@echo "        _/ /\                             /"
	@echo "       (__/  \                           /"
	@echo '    _..---""` \                         /`""---.._'
	@echo " .-'           \                       /          '-."
	@echo ":               '-.__             __.-'              :"
	@echo ':                  ) ""---...---"" (                :'
	@echo "\'._                '"--...___...--"'              _.'"
	@echo '   \""--..__                              __..--""/'
	@echo "     '._     """----.....______.....----"""         _.'"
	@echo '         ""--..,,_____            _____,,..--"""'''
	@echo '                      """------"""'

