# Open Food Facts Products (US, Canada and Mexico)

The packaged-food products from [Open Food Facts](https://world.openfoodfacts.org)
that the [Stock & Savor](https://stockandsavor.app) app uses when a scanned
barcode isn't in USDA FoodData Central. Names and sizes have been tidied up
so they read well in a kitchen list.

This is the `open_product` table exactly as it ships in the app's catalog,
and it's free to anyone under the same license it came with: the
[Open Database License (ODbL) 1.0](LICENSE).

## Download

Get the files from [Releases](../../releases). Each release has:

| File | What it is |
|---|---|
| `open_product-<version>.csv.gz` | gzipped UTF-8 CSV with a header row |
| `open_product-<version>.sqlite.gz` | gzipped SQLite database with one table, `open_product` ([schema](schema.sql)) |
| `SHA256SUMS.txt` | checksums for both files |

The latest release, `2026.04-r7`, has 611,313 products, built from an Open
Food Facts export made on October 28, 2026. It fixes 3,603 names that were
unreadable (written in another alphabet, placeholders, label text) and
leaves out 1,361 records that aren't food or whose names say nothing about
the product. `2026.04-r6` (612,674 products) is the earlier release.

## What's included

There's one row per barcode for products Open Food Facts lists as sold in
the United States, Canada or Mexico that USDA FoodData Central doesn't list.
When a barcode has more than one record, only the newest is used. Records
are left out when they aren't food (cosmetics, cleaning products, medicine),
when their name says nothing about the product ("Test", a single letter),
or when their wording can't be used.

| Column | Meaning |
|---|---|
| `gtin14` | barcode, checksum-checked and zero-padded to 14 digits |
| `name` | product name, cleaned up: title case, brand and size moved out |
| `brand_name` | brand, when the record names one |
| `package_size` | package size as text, such as `16 oz` |
| `description` | extra detail moved out of the name (flavor notes, claims); may be empty |
| `size_amount`, `size_unit`, `size_count` | the size split into a number, a unit and a pack count, when it could be read |
| `name_origin` | how the name was made: `rules` (automatic cleanup rules), `agent` (a reviewed correction, AI-assisted), `owner` (corrected by hand) |
| `modified` | when Open Food Facts last changed the record (`YYYY-MM-DD`) |

Product photos, ingredients, nutrition facts and the other fields in Open
Food Facts aren't included. For those, use Open Food Facts directly.

## How the names were tidied

Names were put in title case (with English, French and Spanish small words
kept lowercase), the brand and size were moved into their own columns, and
a reviewed list of corrections was applied. Names written in another
alphabet were translated into English, and placeholder names were named
from the record's own category; names in French, Spanish or another
language written in the Latin alphabet stay as written. No facts were added
that the original record doesn't say.

## License and credit

- The database is licensed under the **Open Database License (ODbL) v1.0**:
  see [LICENSE](LICENSE). If you publicly use a database you make from it,
  you have to offer that database under the ODbL too.
- Individual contents are under the
  [Database Contents License (DbCL) v1.0](https://opendatacommons.org/licenses/dbcl/1-0/).
- Please credit Open Food Facts, for example: *"Contains product information
  from Open Food Facts (openfoodfacts.org), available under the Open
  Database License."* See [NOTICE](NOTICE).

Stock & Savor isn't affiliated with or endorsed by Open Food Facts. The
data comes as-is, with no guarantee that it's accurate or complete, so
always check the package for allergens and nutrition.

## Questions or corrections

Open an [issue](../../issues). To fix a product for everyone, edit it on
[Open Food Facts](https://world.openfoodfacts.org) and the change will
reach a later release.
