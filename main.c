#include <stdio.h>
#include "libft.h"
#include "ft_graph.h"
#include <limits.h>
#include <locale.h>

int			main(int ac, char **av)
{
	t_btree		*root;

	if (ac == 1)
		return (0);	
	if (!(root = btree_create_node(av[1], ft_strlen(av[1]) + 1)))
		return (1);
	printf("%s\n", root->content);
	printf("%zu\n", sizeof(t_btree));
	// printf("%p\n%p\n", &root->right, &root->c);
	ft_memdel((void**)&root);
	return (0);
}
