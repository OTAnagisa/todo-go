-- +goose Up
-- +goose StatementBegin
SELECT 'up SQL query';
CREATE TABLE section (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted_at TIMESTAMPTZ,
  name VARCHAR(255) NOT NULL DEFAULT '',
  code int NOT NULL DEFAULT 0
);
CREATE TRIGGER update_section
BEFORE UPDATE ON section
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
SELECT 'down SQL query';
DROP TABLE section;
-- +goose StatementEnd
