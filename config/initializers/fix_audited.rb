Audit = Audited::Adapters::ActiveRecord::Audit
Audited.max_audits = 10_000_000
#TODO: potential vulnarability
Audit.attr_accessible :username, :user, :version, :auditable
