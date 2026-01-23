input_file = "eventmgr1_ins.sql"
output_file = "optimized.sql"
rows_per_insert = 1000

rows = []
current_table = None
collecting = False
buffer = []

def flush_rows(out, table, rows_to_flush):
    for i in range(0, len(rows_to_flush), rows_per_insert):
        chunk = rows_to_flush[i:i + rows_per_insert]
        out.write(
            f"INSERT INTO {table} VALUES\n  {',\n  '.join(chunk)};\n"
        )

with open(input_file, "r", encoding="utf-8") as f, open(output_file, "w", encoding="utf-8") as out:
    for line in f:
        line_strip = line.strip()

        # Detect start of INSERT
        if not collecting and line_strip.upper().startswith("INSERT INTO ") and "VALUES" in line_strip.upper():
            collecting = True
            buffer = [line.rstrip("\n")]

            # Extract table name
            header = line_strip.split("VALUES", 1)[0].strip()
            table_name = header.split()[2]

            # If table changed, flush previous rows
            if current_table and table_name != current_table:
                flush_rows(out, current_table, rows)
                rows = []

            current_table = table_name
            continue

        # Collect multi-line INSERT
        if collecting:
            buffer.append(line.rstrip("\n"))

            if line_strip.endswith(");"):
                collecting = False

                # Merge lines
                full_insert = " ".join(buffer)

                # Extract row
                row = full_insert.split("VALUES", 1)[1].strip().rstrip(";")

                if not row.startswith("("):
                    row = f"({row})"

                # Normalize embedded newlines
                row = row.replace("\n", "\\r\\n")

                rows.append(row)
                buffer = []

            continue

        # Non-INSERT line
        if rows and current_table:
            flush_rows(out, current_table, rows)
            rows = []

        out.write(line)

    # End of file
    if rows and current_table:
        flush_rows(out, current_table, rows)
