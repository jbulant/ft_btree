#include "ft_graph.h"

void			btree_rotate_left(t_btree *node)
{
	t_btree		*tmp;

	if (!(tmp = node->right))
		return ;
	node->right = tmp->left;
	tmp->left = node;
	tmp->parent = node->parent;
	node->parent = tmp;
}

void			btree_rotate_right(t_btree *node)
{
	t_btree		*tmp;

	if (!(tmp = node->left))
		return ;
	node->left = tmp->right;
	tmp->right = node;
	tmp->parent = node->parent;
	node->parent = tmp;
}
