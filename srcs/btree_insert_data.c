#include "ft_graph.h"
#include "ft_graph_utils.h"

t_btree			*insert_node(t_btree *root, t_btree *node
							, int (*cmp)(void *, void *))
{
	int		result;

	if (root)
	{
		result = cmp((void *)root->content, (void *)node->content);
		if (result < 0)
		{
		 	if (root->left)
				return (insert_node(root->left, node, cmp));
			root->left = node;
		}
		else
		{
			if (root->right)
				return (insert_node(root->right, node, cmp));
			root->right = node;
		}
	}
	node->parent = root;
	node->color = BT_RED;
	return (node);
}

void	rebalance(t_btree *node)
{
	t_btree	*parent;
	t_btree	*grand_parent;

	grand_parent = node->parent->parent;
	if (node == grand_parent->left->right)
	{
		btree_rotate_left(node->parent);
		node = node->left;
	}
	else if (node == grand_parent->right->left)
	{
		btree_rotate_right(node->parent);
		node = node->right;
	}
	parent = node->parent;
	grand_parent = parent->parent;
	if (node == parent->left)
		btree_rotate_right(grand_parent);
	else
		btree_rotate_left(grand_parent);
	parent->color = BT_BLACK;
	grand_parent->color = BT_RED;
}

void			reorganize_tree_colors(t_btree *node)
{
	t_btree		*uncle;

	if (!node->parent)
		return ((void)(node->color = BT_BLACK));
	else if (node->parent->color == BT_BLACK)
		return ;
	else if ((uncle = node_uncle(node)) && uncle->color == BT_RED)
	{
		node->parent->color = BT_BLACK;
		uncle->color = BT_BLACK;
		uncle->parent->color = BT_RED;
		return (reorganize_tree_colors(uncle->parent));
	}
	rebalance(node);
}

t_btree			*btree_insert_data(t_btree **root, void *data, size_t data_size
								, int (*cmp)(void *, void *))
{
	t_btree		*new_node;

	if (!root || !cmp || !(new_node = btree_create_node(data, data_size)))
		return (NULL);
	insert_node(*root, new_node, cmp);
	reorganize_tree_colors(new_node);
	while (new_node->parent)
		new_node = new_node->parent;
	*root = new_node;
	return (new_node);
}
