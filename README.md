# MTask

## Table Schema

### Tasks                             
  ColumnName      | DataType 
  ----------      | -------- 
  id              | integer 
  title           | string
  content         | string  
  state           | string  
  priority        | string
  deadline        | datetime      
  user_id         | string

### Users
  ColumnName      | DataType 
  ----------      | -------- 
  id              | integer 
  name            | string
  email           | string  
  password_digest | string  
  role            | string

### Categories
  ColumnName      | DataType 
  ----------      | -------- 
  id              | integer 
  name            | string

### Category_of_tasks
  ColumnName      | DataType 
  ----------      | -------- 
  id              | integer 
  task_id         | integer
  Category_id     | integer  

  