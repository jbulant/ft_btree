#include "ft_graph_utils.h"

t_btree		*node_grandparent(t_btree *node)
{
	return ((node && (node = node->parent)) ? node->parent : NULL);
}

t_btree			*node_uncle(t_btree *node)
{
	t_btree	*grandparent;

	if (!node || !node->parent
		|| !(grandparent = node->parent->parent))
		return (NULL);
	if (grandparent->left == node->parent)
		return (grandparent->right);
	return (grandparent->left);
}