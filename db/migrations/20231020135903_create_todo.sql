-- +goose Up
-- +goose StatementBegin
SELECT 'up SQL query';
CREATE TABLE todo (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted_at TIMESTAMPTZ,
  deadline_at TIMESTAMPTZ,
  contents TEXT NOT NULL DEFAULT '',
  completed_at TIMESTAMPTZ,
  is_trashed BOOLEAN NOT NULL DEFAULT false,
  user_id UUID NOT NULL REFERENCES "user" (id)
);
CREATE TRIGGER update_todo
BEFORE UPDATE ON todo
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
SELECT 'down SQL query';
DROP TABLE todo;
-- +goose StatementEnd
