package org.jboss.snowdrop.samples.sportsclub.service;

import org.jboss.snowdrop.samples.sportsclub.domain.entity.Reservation;
import org.jboss.snowdrop.samples.sportsclub.domain.entity.EquipmentType;

import java.util.List;
import java.util.Date;

/**
 *
 */
public interface ReservationService
{
   List<Reservation> getReservations(Date fromDate, Date toDate, Integer nim, Integer max, List<EquipmentType> types);

   Long countReservationsForRange(Date fromDate, Date toDate, List<EquipmentType> types);

   void create(Reservation reservation);

   public void delete(Reservation reservation);

   public Reservation updateReservation(Reservation reservation);
}
