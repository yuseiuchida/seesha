module CombinationsHelper
  # combination/index finds, flavors/show
  def easy_status(combination)
    if combination.rate.easy_rate > 0.7
      '吸いやすい'
    elsif combination.rate.easy_rate < 0.3
      '個性的'
    else
      ''
    end
  end

  def sweet_status(combination)
    if combination.rate.sweet_rate > 0.7
      '甘い'
    else
      ''
    end
  end

  def refresh_status(combination)
    if combination.rate.refresh_rate > 0.7
      'スッキリ'
    else
      ''
    end
  end

  def relax_status(combination)
    if combination.rate.relax_rate > 0.7
      'リラックス'
    else
      ''
    end
  end

  # combinations/Show
  def easy_status_for_show(combination)
    if combination.rate.easy_rate > 0.7
      '吸いやすい'
    elsif combination.rate.easy_rate < 0.3
      '個性的'
    else
      '普通'
    end
  end

  def sweet_status_for_show(combination)
    if combination.rate.sweet_rate > 0.6
      '甘い'
    else
      '甘くない'
    end
  end

  def refresh_status_for_show(combination)
    if combination.rate.refresh_rate > 0.7
      'スッキリする'
    elsif combination.rate.refresh_rate > 0.4
      '普通'
    else
      'スッキリしない'
    end
  end

  def relax_status_for_show(combination)
    if combination.rate.relax_rate > 0.7
      'リラックスする'
    else
      'リラックスしない'
    end
  end
end
