class PublicSetUpAccess < ApplicationRecord
  # no relation defined back to PublicSetUpAccess because queries like PublicSetUpAccess.new.public_set_ups does not have
  # a fonctional meaning beyond theory. Otherwise, it would require to name (with a class_name) differently each relationship

end
