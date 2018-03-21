#include "ft_btree.h"

static void		*search_data(t_btree *root, void *data_ref
							, int (*cmp)(void *, void *))
{
	int		result;

	if (!root)
		return (NULL);
	result = cmp(root->content, data_ref);
	if (result == 0)
		return (btree->content);
	else if (result > 0)
		return (search_data(root->right, data_ref, cmp));
	return (search_data(root->left, data_ref, cmp));
}

void			*btree_search_data(t_btree *root, void *data_ref
								, int (*cmp)(void *, void *))
{
	if (!data_ref || !cmp)
		return (NULL);
	return (search_data(root, data_ref, cmp));
}
