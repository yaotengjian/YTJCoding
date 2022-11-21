#pragma once
#include<stdio.h>
#include<malloc.h>
#include<assert.h>

typedef int DataType;
typedef struct SHListNode
{
	struct  SHListNode* _pNext;
	DataType _data;
}SHLNode,*PSHLNode;


//找新节点。
PSHLNode BuySHListNode(DataType data)
{
	PSHLNode pNewNode = (PSHLNode)malloc(sizeof(SHLNode));
	if (NULL == pNewNode)
	{
		assert(0);
		return NULL;
	}
	pNewNode->_pNext = NULL;
	pNewNode->_data = data;

	return pNewNode;

}

//什么时候该用二级指针？ 
//初始化
void SHListInit(PSHLNode* pHead)
{
	assert(pHead);
	*pHead = BuySHListNode(0);
	(*pHead)->_pNext = NULL;
}

//尾插
void SHListPushBack(PSHLNode pHead,DataType data)
{
	PSHLNode pTail = pHead;
	assert(pHead);
	while (pTail->_pNext)
		pTail = pTail->_pNext;
	pTail->_pNext = BuySHListNode(data);

}
//尾删
void SHListPopBack(PSHLNode pHead)
{
	PSHLNode pTail = pHead;
	assert(pHead);
	if (NULL == pHead->_pNext)
		return;
	else
	{
		PSHLNode pPreTail = NULL;
		while (pTail->_pNext)
		{
			pPreTail = pTail;
			pTail = pTail->_pNext;
		}
		free(pTail);
		pPreTail->_pNext = NULL;
	}
}



//头插
void SHListPushFront(PSHLNode pHead, DataType data)
{
	PSHLNode pNewNode = NULL;
	assert(pHead);
	pNewNode = BuySHListNode(data);
	pNewNode->_pNext = pHead->_pNext;
	pHead->_pNext = pNewNode;

}
//头删
void SHListPopFront(PSHLNode pHead)
{

	assert(pHead);
	if (NULL == pHead->_pNext)
		return;
	else
	{
		PSHLNode pDelNode = pHead->_pNext;
		pHead->_pNext = pDelNode->_pNext;

		free(pDelNode);
	}
}
void PrintSHList(PSHLNode pHead)
{
	PSHLNode pCur = NULL;
	assert(pHead);
	pCur = pHead->_pNext;
	while (pCur)
	{
		printf("%d ----> ", pCur->_data);
		pCur = pCur->_pNext;
	}
	printf("NULL\n");

}
////顺序表：底层空间连续，支持随机访问  插入删除O(N)
////  链表：不一定连续，不支持随机访问，空间利用率高 O(1） 


void Test()
{
	PSHLNode pHead;
	SHListInit(&pHead);
	SHListPushBack(pHead, 1);
	SHListPushBack(pHead, 2);
	SHListPushBack(pHead, 3);
	SHListPushBack(pHead, 4);
	SHListPushBack(pHead, 5);
	SHListPushBack(pHead, 6);
	PrintSHList(pHead);

	SHListPopBack(pHead);
	PrintSHList(pHead);

	SHListPushFront(pHead, 0);
	PrintSHList(pHead);


	SHListPopFront(pHead);
	PrintSHList(pHead);

}
