#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jbulant <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/07 16:49:28 by jbulant           #+#    #+#              #
#    Updated: 2018/03/21 00:27:54 by jerome           ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME = ft_graph.a

DEBUG = 1

LIBFTDIR = libft/
LIBFT_NAME = libft.a
LIBFT = $(LIBFTDIR)$(LIBFT_NAME)

SRCSDIR = srcs/
SRCS_NAME = 
SRCS = $(addprefix $(SRCSDIR),$(SRCS_NAME))

OBJDIR = objs/
OBJS = $(addprefix $(OBJDIR),$(SRCS_NAME:.c=.o))

INCLUDES = -Iincludes -Ilibft
LIBS = -L $(LIBFTDIR) -lft

CFLAGS = -Wall -Wextra -Werror
DEBUGFLAGS = -fsanitize=address -g3

.PHONY: all clean fclean re

all: $(NAME)

$(OBJDIR)%.o: $(SRCSDIR)%.c
	@mkdir -p objs
	@echo compiling: `echo $< | rev | cut -d'/' -f1 | rev | cut -d'.' -f1`
	@$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $<

$(NAME): $(OBJS) $(LOBJS)
	ar rc $(NAME) $(OBJS) $(LOBJS)
	ranlib $(NAME)

test: $(NAME)
	@if [ $(DEBUG) -eq 1 ];\
	then\
		$(CC) $(CFLAGS) $(DEBUGFLAGS) $(INCLUDES) $(NAME) $(LIBS) -o `echo $(NAME) | rev | cut -d'.' -f2 | rev`_test;\
	else\
		$(CC) $(CFLAGS) $(INCLUDES) $(NAME) $(LIBS) -o `echo $(NAME) | rev | cut -d'.' -f2 | rev`_test;\
	fi

clean:
	rm -f $(OBJS)
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME)

re: fclean all
