class WikiPolicy < ApplicationPolicy

  def edit?
    (user.present? && (record.user == user || user.admin? )) ||  record.contributors.include?(user)
  end

end