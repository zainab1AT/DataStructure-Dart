
void main() {
  
  // Challenge 1: Reverse a List
  print('Reverse a List');
  var myList = [1, 2, 3, 4, 5];
  reverseList(myList);
  
  // Challenge 2: Balance the Parentheses
  print('Balance the Parentheses');
  var balancedStr = '(a + b) - (c * d)';
  var unbalancedStr1 = '((a + b) - (c * d)';
  var unbalancedStr2 = '(a + b) - (c * d))';

  print('$balancedStr is balanced: ${isBalancedParentheses(balancedStr)}');
  print('$unbalancedStr1 is balanced: ${isBalancedParentheses(unbalancedStr1)}');
  print('$unbalancedStr2 is balanced: ${isBalancedParentheses(unbalancedStr2)}');
  
  
  
}

class Stack<T> {
  List<T> _items = [];

  void push(T item) {
    _items.add(item);
  }

  T pop() {
    if (isEmpty) {
      throw StateError('Stack is empty');
    }
    return _items.removeLast();
  }

  T peek() {
    if (isEmpty) {
      throw StateError('Stack is empty');
    }
    return _items.last;
  }

  bool get isEmpty => _items.isEmpty;
}

void reverseList(List<dynamic> list) {
  var stack = Stack<dynamic>();

  for (var item in list) {
    stack.push(item);
  }

  while (!stack.isEmpty) {
    print(stack.pop());
  }
}

bool isBalancedParentheses(String str) {
  var stack = Stack<String>();

  for (var char in str.split('')) {
    if (char == '(') {
      stack.push(char);
    } else if (char == ')') {
      if (stack.isEmpty) {
        return false;
      }
      stack.pop();
    }
  }

  return stack.isEmpty;
}
