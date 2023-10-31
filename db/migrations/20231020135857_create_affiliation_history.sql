-- +goose Up
-- +goose StatementBegin
SELECT 'up SQL query';
CREATE TABLE affiliation_history (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted_at TIMESTAMPTZ,
  user_id UUID NOT NULL REFERENCES "user" (id),
  section_id UUID NOT NULL REFERENCES section (id),
  start_on DATE NOT NULL,
  end_on DATE
);
CREATE TRIGGER update_affiliation_history
BEFORE UPDATE ON affiliation_history
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
SELECT 'down SQL query';
DROP TABLE affiliation_history;
-- +goose StatementEnd
