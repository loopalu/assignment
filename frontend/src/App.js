import React, { useState, useEffect } from 'react';
import './App.css';

function App() {
  const [sectors, setSectors] = useState([]);
  const [name, setName] = useState('');
  const [selectedSectors, setSelectedSectors] = useState([]);
  const [agreedToTerms, setAgreedToTerms] = useState(false);
  const [validationMessage, setValidationMessage] = useState('');

  useEffect(() => {
        fetch('http://localhost:8080/sector')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                if (Array.isArray(data)) {
                    setSectors(data);
                } else {
                    console.error('Data is not an array:', data);
                }
            })
            .catch(error => {
                console.error('Error fetching sectors:', error);
            });
    }, []);

    const validateForm = () => {
        const nameRegex = /^[a-zA-ZõäöüÕÄÖÜ]+(([',. -][a-zA-ZõäöüÕÄÖÜ ])?[a-zA-ZõäöüÕÄÖÜ]*)*$/;
        if (!nameRegex.test(name) || name.trim().length === 0) {
            return 'Please fill in the name field with a valid name.';
        }

        if (name.trim().length > 70) {
            return 'A name can\'t be that long. Please set a correct name.';
        }

        if (selectedSectors.length === 0) {
            return 'Please select at least one sector from the dropdown list.';
        }

        if (!agreedToTerms) {
            return 'You must agree to the terms.';
        }

        // If all validations pass
        return '';
    };

  const handleSectorChange = (event) => {
    const values = Array.from(event.target.selectedOptions, option => option.value);
    setSelectedSectors(values);
  };

  const handleSubmit = (event) => {
      event.preventDefault();

      const message = validateForm();
      if (message !== '') {
        setValidationMessage(message);
        return; // Prevent form submission
      }
      // Reset validation message if validation passes
      setValidationMessage('');

      const formData = {
      name,
      selectedSectors,
      agreedToTerms
    };

    fetch('http://localhost:8080/client', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(formData),
    })
        .then(response => response.json())
        .then(data => {
          console.log('Success:', data);

          setName(data.name);
          setSelectedSectors(data.selectedSectors);
          setAgreedToTerms(data.agreedToTerms);
        })
        .catch((error) => {
          console.error('Error:', error);
        });
  };

    const renderOptions = (sectors, parentId = null, level = 0) => {
        return sectors
            .filter(sector => sector.parentId === parentId)
            .map(sector => (
                <React.Fragment key={sector.sectorId}>
                    <option value={sector.sectorId}>
                        {`${'\u00A0'.repeat(level * 4)}${sector.name}`}
                    </option>
                    {renderOptions(sectors, sector.sectorId, level + 1)}
                </React.Fragment>
            ));
    };

  return (
      <form onSubmit={handleSubmit} className="form-container">
          <p>Please enter your name and pick the Sectors you are currently involved in.</p>
          <div className="form-group">
              <label htmlFor="name">Name:</label>
              <input
                  type="text"
                  id="name"
                  value={name}
                  onChange={(e) => setName(e.target.value)}
              />
          </div>

          <div className="form-group">
              <label htmlFor="sectors">Sectors:</label>
              <select
                  multiple
                  size="5"
                  id="sectors"
                  value={selectedSectors}
                  onChange={handleSectorChange}
              >
                  {renderOptions(sectors)}
              </select>
          </div>

          <div className="terms-group">
              <div>
                  <label htmlFor="terms" className="terms-label">Agree to terms</label>
              </div>
              <div>
                  <input
                      type="checkbox"
                      id="terms"
                      checked={agreedToTerms}
                      onChange={(e) => setAgreedToTerms(e.target.checked)}
                      className="terms-checkbox"
                  />
              </div>
          </div>

          <div className="form-group">
              <input type="submit" value="Save" />
          </div>

          {validationMessage && <div className="alert-danger" role="alert">
              {validationMessage}
          </div>}
      </form>
  );
}

export default App;