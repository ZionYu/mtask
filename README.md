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

## Deploy
  1. 安裝 Heroku  $ brew install heroku
  2. 登入 Heroku  $ heroku login
  3. 建立應用程式 $ heroku create 'App Name'
  4. 變更資料庫：
    * sqlite3 移至開發與測試群組
    * production 群組裡加入 pg
    * 修改資料庫設定檔
  5. $ heroku git:remote 'App Name'
  6. $ git push heroku master
  7. 遷移資料庫  $ heroku run rake db:migrate

  