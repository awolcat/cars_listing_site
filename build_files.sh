echo "BUILD START"
python3 -m venv venv

# activate the virtual environment
source venv/bin/activate

pip install -r Mekason/requirements.txt
python3 Mekason/manage.py collectstatic --noinput
echo "BUILD END"