class Node<T> {
  dynamic data;
  Node<T>? next;

  Node(this.data, [this.next]);
}

class LinkedList {
  Node? head;

  void printList() {
    var current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  void insert(dynamic data) {
    var newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      newNode.next = head;
      head = newNode;
    }
  }

  void remove(dynamic data) {
    if (head == null) return;

    if (head!.data == data) {
      head = head!.next;
      return;
    }

    var current = head;
    while (current?.next != null && current.next!.data != data) {
      current = current?.next;
    }

    if (current?.next != null) {
      current!.next = current.next!.next;
    }
  }

  void reverse() {
    Node? prev = null;
    Node? current = head;
    Node? nextNode;

    while (current != null) {
      nextNode = current.next;
      current.next = prev;
      prev = current;
      current = nextNode;
    }

    head = prev;
  }

  Node? findMiddle() {
    if (head == null) return null;

    var slow = head;
    var fast = head;

    while (fast?.next != null && fast?.next?.next != null) {
      slow = slow?.next;
      fast = fast?.next?.next;
    }

    return slow;
  }

  void removeAllOccurrences(dynamic data) {
    if (head == null) return;

    while (head?.data == data) {
      head = head?.next;
    }

    var current = head;
    while (current?.next != null) {
      if (current.next!.data == data) {
        current.next = current.next!.next;
      } else {
        current = current.next;
      }
    }
  }
}

void main() {
  var linkedList = LinkedList();

  // Challenge 1: Print in Reverse
  print('Challenge 1: Print in Reverse');
  linkedList.insert(1);
  linkedList.insert(2);
  linkedList.insert(3);
  linkedList.insert(4);
  linkedList.printList();
  print('Reversed List:');
  linkedList.reverse();
  linkedList.printList();

  // Challenge 2: Find the Middle Node
  print('\nChallenge 2: Find the Middle Node');
  linkedList.insert(5);
  linkedList.printList();
  var middleNode = linkedList.findMiddle();
  print('Middle Node: ${middleNode?.data}');

  // Challenge 3: Reverse a Linked List
  print('\nChallenge 3: Reverse a Linked List');
  linkedList.reverse();
  linkedList.printList();

  // Challenge 4: Remove All Occurrences
  print('\nChallenge 4: Remove All Occurrences');
  linkedList.insert(3);
  linkedList.printList();
  linkedList.removeAllOccurrences(3);
  linkedList.printList();
}
