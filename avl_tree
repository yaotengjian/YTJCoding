#include <iostream>
using namespace std;
template <class K, class V>
struct AVLTreeNode
{
	AVLTreeNode(const K& key, const V& value)
	: _pLeft(NULL)
	, _pRight(NULL)
	, _pParent(NULL)
	, _key(key)
	, _value(value)
	, _bf(0)
	{}
	AVLTreeNode<K, V>* _pLeft;
	AVLTreeNode<K, V>* _pRight;
	AVLTreeNode<K, V>* _pParent;
	K _key;
	V _value;
	int _bf;
};

template <class K, class V>
class AVLTree
{
	typedef AVLTreeNode<K, V> Node;
	typedef Node* pNode;
public:
	AVLTree()
		: _pRoot(NULL)
	{}

	bool Insert(const K& key, const V& value)
	{
		if (NULL == _pRoot)//1. 空树直接添加结点
		{
			_pRoot = new Node(key, value);
			return true;
		}
		//2. 非空树
		//(1) 查找添加的位置
		pNode pParent = NULL;
		pNode pCur = _pRoot;
		while (pCur)
		{
			if (key < pCur->_key)
			{
				pParent = pCur;
				pCur = pCur->_pLeft;
			}
			else
			{
				pParent = pCur;
				pCur = pCur->_pRight;
			}
		}
		//(2) 插入结点
		pCur = new Node(key, value);
		if (key < pParent->_key)//插入到左边
		{
			pCur->_pParent = pParent;
			pParent->_pLeft = pCur;
		}
		else if (key > pParent->_key)//插入到右边
		{
			pCur->_pParent = pParent;
			pParent->_pRight = pCur;
		}
		else//插入的结点已经存在
			return false;
		//(3) 更新平衡因子，使二叉树平衡
		while (pParent)
		{
			if (pParent->_pLeft == pCur)
				pParent->_bf--;
			else if (pParent->_pRight == pCur)
				pParent->_bf++;

			if (pParent->_bf == 0)
				break;//不需要调节
			else if (pParent->_bf == 1 || pParent->_bf == -1)//平衡因子在-1或1时，继续向上调节
			{
				pCur = pParent;
				pParent = pParent->_pParent;
			}
			else//平衡因子在2或者-2时，调节至平衡
			{
				if (pParent->_bf == 2)
				{
					if (pCur->_bf == 1)
						RotateL(pParent);
					else
						RotateRL(pParent);
				}
				else
				{
					if (pCur->_bf == -1)
						RotateR(pParent);
					else
						RotateLR(pParent);
				}
				break;
			}
		}//end of while
		return true;
	}


	void InOrder()
	{
		_InOrder(_pRoot);
	}

	bool IsBalance()
	{
		return _IsBalance(_pRoot);
	}

	int Height()
	{
		return _Height(_pRoot);
	}


private:
	bool _IsBalance(pNode pRoot)
	{
		if (pRoot == NULL)
			return true;
		int left = _Height(pRoot->_pLeft);
		int right = _Height(pRoot->_pRight);
		if (abs(right - left) > 1)
			return false;
		return true;
	}

	int _Height(pNode pRoot)
	{
		if (NULL == pRoot)
			return 0;
		int left = _Height(pRoot->_pLeft);
		int right = _Height(pRoot->_pRight);
		return left > right ? left + 1 : right + 1;
	}


	void RotateL(pNode pParent)
	{
		pNode pSubR = pParent->_pRight;
		pNode pSubRL = pSubR->_pLeft;
		pParent->_pRight = pSubRL;//调节pSubRL
		if (pSubRL)
			pSubRL->_pParent = pParent;
		pNode pPParent = pParent->_pParent;//记录pParent的双亲
		pSubR->_pLeft = pParent;//调节pSubR
		pParent->_pParent = pSubR;
		pSubR->_pParent = pPParent;//调节pSubR的双亲
		if (pParent == _pRoot)
		/*if (pPParent == NULL)*/
			_pRoot = pSubR;
		else
		{
			if (pParent == pPParent->_pLeft)
				pPParent->_pLeft = pSubR;
			else if (pParent == pPParent->_pRight)
				pPParent->_pRight = pSubR;
		}
		pSubR->_bf = 0;
		pParent->_bf = 0;
	}


	void RotateR(pNode pParent)
	{
		pNode pSubL = pParent->_pLeft;
		pNode pSubLR = pSubL->_pRight;
		pParent->_pLeft = pSubLR;//调节pSubLR
		if (pSubLR)
			pSubLR->_pParent = pParent;
		pNode pPParent = pParent->_pParent;//记录pParent的双亲
		pSubL->_pRight = pParent;
		pParent->_pParent = pSubL;
		pSubL->_pParent = pPParent;//调节pSubL的双亲
		if (pParent == _pRoot)
		/*if (pPParent == NULL)*/
			_pRoot = pSubL;
		else
		{
			if (pParent == pPParent->_pLeft)
				pPParent->_pLeft = pSubL;
			else
				pPParent->_pRight = pSubL;
		}
		pSubL->_bf = 0;
		pParent->_bf = 0;
	}


	void RotateLR(pNode pParent)
	{
		pNode pSubL = pParent->_pLeft;
		pNode pSubLR = pSubL->_pRight;
		int bf = pSubLR->_bf;
		RotateL(pSubL);
		RotateR(pParent);
		if (bf == -1)
			pParent->_bf = 1;
		else if (bf == 1)
			pSubL->_bf = -1;
	}


	void RotateRL(pNode pParent)
	{
		pNode pSubR = pParent->_pRight;
		pNode pSubRL = pSubR->_pLeft;
		int bf = pSubRL->_bf;
		RotateR(pSubR);
		RotateL(pParent);
		if (bf == -1)
			pSubR->_bf = 1;
		else if (bf == 1)
			pParent->_bf = -1;
	}


	void _InOrder(pNode pRoot)
	{
		if (pRoot)
		{
			_InOrder(pRoot->_pLeft);
			cout << "<" << pRoot->_key << "," << pRoot->_value << ">" << endl;
			_InOrder(pRoot->_pRight);
		}
	}

private:
	pNode _pRoot;
};
void Test()
{
	int arr[] = { 4, 2, 6, 1, 3, 5, 15, 7, 16, 14 };
	AVLTree<int, int> t;
	for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); i++)
		t.Insert(arr[i], arr[i]);
	t.InOrder();

	if (t.IsBalance())
		cout << "平衡" << endl;
	else
		cout << "不平衡" << endl;
	cout << "树的高度为：";
	cout << t.Height() << endl;
}
int main()
{
	Test();
}
