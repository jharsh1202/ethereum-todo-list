pragma solidity >=0.4.22 <0.9.0;


contract TodoList {
  uint public taskCount = 0;

  struct Task {
    uint id;
    string description;
    bool is_completed;
  }

  mapping(uint => Task) public tasks;

  constructor() public {
    createTask("Hey, Task one is take a pledge that you would complete all of your tasks today!");
  }

  function createTask(string memory _description) public {
    taskCount++;
    tasks[taskCount] = Task(taskCount, _description, false);
  }
}
