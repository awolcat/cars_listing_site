echo "BUILD START"
python3 -m venv venv

# activate the virtual environment
source venv/bin/activate

pip install -r requirements.txt
python3 manage.py collectstatic --noinput

# deactivate the virtual environment and delete it
deactivate
rm -rf env
echo "BUILD END"