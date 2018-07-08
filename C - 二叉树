/*
#pragma once
#include<stdio.h>
#include<assert.h>
#include<malloc.h>
#include<string.h>


typedef char BTDataType;
typedef struct BinTreeNode
{
	struct BinTreeNode* _left;
	struct BinTreeNode* _right;
	BTDataType data;
	
}BTNode,*PBTNode;

创建新节点
PBTNode BuyBinTreeNode(BTDataType data)
{
	PBTNode pNewNode = (PBTNode)malloc(sizeof(BTNode));
	if (NULL == pNewNode)
	{
		assert(0);
		return NULL;
	}
	pNewNode->_left = NULL;
	pNewNode->_right = NULL;
	pNewNode->data = data;
	return pNewNode;
}

创建二叉树
void _CreateBinTree(PBTNode* pRoot, const BTDataType* arr, int size, int* index,BTDataType invaild)
{
	assert(pRoot);
	assert(index);
	if (*index < size && invaild != arr[*index])
	{
		创建根节点
		*pRoot = BuyBinTreeNode(arr[*index]);
		创建根节点的左子树
		++(*index);
		_CreateBinTree(&(*pRoot)->_left, arr, size, index,invaild);
		创建根节点的右子树
		++(*index);
		_CreateBinTree(&(*pRoot)->_right, arr, size, index,invaild);
	}
}

void CreateBinTree(PBTNode* pRoot, const BTDataType* arr, int size,  BTDataType invaild)
{
	int index = 0;
	_CreateBinTree(&(*pRoot), arr, size, &index, invaild);
}


二叉树的拷贝
PBTNode CopyBinTree(PBTNode pRoot)
{
	PBTNode pNewRoot = NULL;
	if (pRoot)
	{
		pNewRoot = BuyBinTreeNode(pRoot->data);
		拷贝根节点的左子树
		pNewRoot->_left = CopyBinTree(pRoot->_left);
		拷贝根节点的右子树
		pNewRoot->_right = CopyBinTree(pRoot->_right);
	}
	return pNewRoot;
}


前序遍历
void PreOrder(PBTNode pRoot)
{
	if (pRoot)
	{
		printf("%c", pRoot->data);
		PreOrder(pRoot->_left);
		PreOrder(pRoot->_right);
	}
}
循环
void PreOrderNor(PBTNode pRoot)
{

}



中序遍历
void InOrder(PBTNode pRoot)
{
	if (pRoot)
	{
		InOrder(pRoot->_left);
		printf("%c", pRoot->data);
		InOrder(pRoot->_right);
	}
}



后序遍历
void PostOrder(PBTNode pRoot)
{
	if (pRoot)
	{
		PostOrder(pRoot->_left);
		PostOrder(pRoot->_right);
		printf("%c", pRoot->data);
	}
}


二叉树的销毁
void DestroyBinTree(PBTNode *pRoot)
{
	assert(pRoot);
	if (*pRoot)
	{
		销毁左子树/右子树/根
		DestroyBinTree(&(*pRoot)->_left);
		DestroyBinTree(&(*pRoot)->_right);
		free(*pRoot);
		pRoot = NULL;
	}
}

镜像二叉树
void Swap(PBTNode* pleft, PBTNode* pright)//交换函数
{
	PBTNode ptmp = NULL;
	assert(pleft);
	assert(pright);
	ptmp = *pleft;
	*pleft = *pright;
	*pright = ptmp;
}
void MirrorBinTree(PBTNode pRoot)
{
	递归
	if(pRoot)
	{
		Swap(&pRoot->_left, &pRoot->_right);
		MirrorBinTree(pRoot->_left);
		MirrorBinTree(pRoot->_right);
	}
}
void MirrorBinTreeNor(PBTNode pRoot)
{
	//循环的方式要使用队列
	Queue q;
	if (NULL == pRoot)
	{
		return;
	}
}

二叉树节点的个数
int BinTreeSize(PBTNode pRoot)
{
	if (NULL == pRoot)
	{
		return 0;
	}
	return BinTreeSize(pRoot->_left) + BinTreeSize(pRoot->_right) + 1;
}

叶子节点的个数
int GetLeafCount(PBTNode pRoot)
{
	if (NULL == pRoot)
	{
		return 0;
	}
	if (NULL == pRoot->_left && NULL == pRoot->_right);
	return 1;

	return (GetLeafCount(pRoot->_left) + GetLeafCount(pRoot->_right));
}

二叉树的高度
int Height(PBTNode pRoot)
{
	int leftHeight, rightHeight;
	if (NULL == pRoot)
	{
		return 0;
	}
	leftHeight = Height(pRoot->_left);
	rightHeight = Height(pRoot->_right);
	return leftHeight > rightHeight ? leftHeight + 1 : rightHeight + 1;
}

求第K层节点的个数
int GetKleve1Node(PBTNode pRoot, int K)
{
	if (NULL == pRoot || K < 1)
		return 0;
	if (1 == K)
		return 1;
	return GetKleve1Node(pRoot->_left, K - 1) + GetKleve1Node(pRoot->_right, K - 1);
}

//是否为平衡二叉树...
//分层遍历二叉树（广度优先搜索）
void leavelTraverse(PBTNode pRoot)
{
	if (pRoot == NULL)
		return;
}


查找节点
BTNode*  Find(PBTNode pRoot, BTDataType data)
{
	PBTNode pRet = NULL;
	if (NULL == pRoot)
		return NULL;
	if (data == pRoot->data)
		return pRoot;
	if (pRet == Find(pRoot->_left, data))
		return pRet;
	return Find(pRoot->_right, data);
}


查看节点是否在二叉树里面
int IsNodeBinTree(BTNode* pRoot,PBTNode pNode)
{
	int ret = 0;
	if (NULL == pRoot || NULL == pNode)
	{
		return 0;
	}
	if (pRoot = pNode)
		return 1;
	if (ret = IsNodeBinTree(pRoot->_left, pNode))
		return ret;
	return IsNodeBinTree(pRoot->_right,pNode);
}



//判断是否为完全二叉树
int IsComplateBinTree(PBTNode pRoot)
{
	int flag = 0;//做标记
	Queue q;//使用队列
	if (NULL == pRoot)
		return 1;
	QueueInit(&q);
	QueuePush(&q, pRoot);
	while (!QueueEmpty(&q))
	{
		PBTNode  pCur = QueueFront(&q);
		if (flag)
		{
			if (pCur->_left && pCur->_right)
			{
				return 0;
			}
			else
			{
				if (pCur->_left&&pCur->_right)
				{
					QueuePush(&q, pCur->_left);
					QueuePush(&q, pCur->_right);
				}
				else if (pCur->_left)
				{
					QueuePush(&q, pCur->_left);
					flag = 1;
				}
				else if (pCur->_right)
					return 0;
			}
			flag = 1;
		}
		QueuePop(&q);
	}
	return 1;
}
