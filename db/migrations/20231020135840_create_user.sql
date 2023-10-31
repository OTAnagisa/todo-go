-- +goose Up
-- +goose StatementBegin
SELECT 'up SQL query';
CREATE TABLE "user" (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted_at TIMESTAMPTZ,
  last_name VARCHAR(25) NOT NULL DEFAULT '',
  first_name VARCHAR(25) NOT NULL DEFAULT '',
  email VARCHAR(255) NOT NULL DEFAULT ''
);
CREATE TRIGGER update_user
BEFORE UPDATE ON "user"
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
SELECT 'down SQL query';
DROP TABLE "user";
-- +goose StatementEnd
