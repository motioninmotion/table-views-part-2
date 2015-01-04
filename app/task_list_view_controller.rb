class TaskListViewController < UITableViewController

  def loadView
    super

    tableView.registerClass(DefaultCell, forCellReuseIdentifier: DefaultCell::ID)
    tableView.registerClass(SubtitleCell, forCellReuseIdentifier: SubtitleCell::ID)
    tableView.registerClass(ValueOneCell, forCellReuseIdentifier: ValueOneCell::ID)
    tableView.registerClass(ValueTwoCell, forCellReuseIdentifier: ValueTwoCell::ID)

    self.title = "Tasks"
  end

  def tableView(tableView, numberOfRowsInSection: section)
    Task.all.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    task = Task.all[indexPath.row]

    if task.type == :value_one
      cell = tableView.dequeueReusableCellWithIdentifier(ValueOneCell::ID, forIndexPath: indexPath)
    elsif task.type == :value_two
      cell = tableView.dequeueReusableCellWithIdentifier(ValueTwoCell::ID, forIndexPath: indexPath)
    elsif task.type == :subtitle
      cell = tableView.dequeueReusableCellWithIdentifier(SubtitleCell::ID, forIndexPath: indexPath)
    else
      cell = tableView.dequeueReusableCellWithIdentifier(DefaultCell::ID, forIndexPath: indexPath)
    end

    cell.textLabel.text = task.title

    if cell.imageView
      cell.imageView.image = UIImage.imageNamed(task.image)
    end

    if cell.detailTextLabel
      cell.detailTextLabel.text = task.subtitle
    end

    cell
  end
end
