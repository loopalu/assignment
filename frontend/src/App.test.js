import React from 'react';
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import App from './App';

test('user can enter a name', () => {
  render(<App />);
  fireEvent.change(screen.getByLabelText(/Name:/), { target: { value: 'Aivar' } });
  expect(screen.getByLabelText(/Name:/)).toHaveValue('Aivar');
});

test('user can agree to terms', () => {
  render(<App />);
  fireEvent.click(screen.getByLabelText(/Agree to terms/));
  expect(screen.getByLabelText(/Agree to terms/)).toBeChecked();
});

test('invalid name will show an error', async () => {
  render(<App />);
  fireEvent.change(screen.getByLabelText(/Name:/), { target: { value: '123' } });
  fireEvent.click(screen.getByText(/Save/));
  await waitFor(() => expect(screen.getByRole('alert')).toHaveTextContent('Please fill in the name field with a valid name.'));
});

test('name that exceeds 70 characters will show an error', async () => {
  render(<App />);
  const longName = 'a'.repeat(100);
  fireEvent.change(screen.getByLabelText(/Name:/), { target: { value: longName } });
  fireEvent.click(screen.getByText(/Save/));
  await waitFor(() => expect(screen.getByRole('alert')).toHaveTextContent("A name can't be that long. Please set a correct name."));
});

test('having no sectors selected will show an error', async () => {
  render(<App />);
  fireEvent.change(screen.getByLabelText(/Name:/), { target: { value: 'Aivar' } });
  fireEvent.click(screen.getByText(/Save/));
  await waitFor(() => expect(screen.getByRole('alert')).toHaveTextContent('Please select at least one sector from the dropdown list.'));
});
