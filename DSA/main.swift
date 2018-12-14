
let singleList = SinglyLinkedList()
singleList.append(value: "hi")
singleList.append(value: "hey")
singleList.append(value: "sup")
print(singleList)

singleList.remove(node: singleList.nodeAt(index: 0)!)
print(singleList)


let doubleList = DoublyLinkedList(value: "hello")
doubleList.append(value: "hi")
doubleList.append(value: "hey")
doubleList.append(value: "sup")
print(doubleList)

doubleList.remove(node: doubleList.nodeAt(index: 0)!)
print(doubleList)
