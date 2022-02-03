namespace TodoApi.Models {
  public class TodoItemDTO {
    public long Id {get;}
    public string Name {get;}
    public bool IsComplete {get;}

    public TodoItemDTO(long id, string name, bool isComplete) {
      Id = id;
      Name = name;
      IsComplete = isComplete;
    }
    public static TodoItemDTO FromTodoItem(TodoItem item) {
      return new TodoItemDTO(item.Id, item.Name, item.IsComplete);
    }
  }
}